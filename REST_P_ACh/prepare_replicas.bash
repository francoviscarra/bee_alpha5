module purge
module load compilers/gcc/10.3
module load compilers/cuda/gcc-10.3/11.5 
module load mpi/openmpi-x86_64 
source /home/scro4068/opt/gromacs-2021.4-plumed-2.7/bin/GMXRC
export PATH="/home/scro4068/opt/plumed-2.8_mpi/bin:$PATH"
export PLUMED_KERNEL=/home/scro4068/opt/plumed-2.8_mpi/lib/libplumedKernel.so
export LD_LIBRARY_PATH="/home/scro4068/opt/plumed-2.8_mpi/lib:$LD_LIBRARY_PATH"


# n of replicas
nrep=16
# "effective" temperature range
tmin=310
tmax=1000

# build geometric progression
list=$(
awk -v n=$nrep \
    -v tmin=$tmin \
    -v tmax=$tmax \
  'BEGIN{for(i=0;i<n;i++){
    t=tmin*exp(i*log(tmax/tmin)/(n-1));
    printf(t); if(i<n-1)printf(",");
  }
}'
)
echo $list > temps.dat

# clean directory
#rm -fr \#*
#rm -fr topol*

for((i=0;i<nrep;i++))
do

# choose lambda as T[0]/T[i]
# remember that high temperature is equivalent to low lambda
  mkdir $i
  lambda=$(echo $list | awk 'BEGIN{FS=",";}{print $1/$'$((i+1))';}')
# process topology
# (if you are curious, try "diff topol0.top topol1.top" to see the changes)
  plumed partial_tempering $lambda < hot.top > $i/topol$i.top
# prepare tpr file
# -maxwarn is often needed because box could be charged
  gmx_mpi grompp  -maxwarn 2 -o $i/topol.tpr -f md.mdp -p $i/topol$i.top -c npt.gro -n tgroups.ndx -r npt.gro
  cp plumed.dat $i/
#  cp chainfix.pdb $i/
done
