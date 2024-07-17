# Characterization of a novel nicotinic acetylcholine receptor subtype preferentially sensitive to biogenic amines

Authors: Eleanor L. Mitchell, Emily B. Armstrong,  Franco Viscarra, Isabel Bermudez, Philip C. Biggin, James A. Goodchild and Andrew K. Jones.

Reference DOI: *placeholder for when its published*

## Contents:

- `REST_*`: Contains files for the replica exchange simulation with bee alpha5 WT/mutants with either dopamine or acetylcholine 
    - `prepare_replicas.bash`: Script to prepare topologies for the REST simulation
    - `hot.top`: Topology ready for tempering with plumed partial tempering.
    - `md.mdp`: Contains the parameters for the MD simulation
    - `npt.gro`: Starting coordinates for the simulation
    - `analysis`
        - `cluster`: RMSD based clustering of the target simulation
    - `0`: Contains the files for the first replica (target temperature 310K)
        - `topol0.top`: Topology file for replica 0
        - `clean.xtc`: Trajectory file for replica 0 dt = 100ps / no solvent
        - `clean.gro`: Coordinate file for replica 0 no solvent
