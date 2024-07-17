# Simulation data for "Characterization of a novel nicotinic acetylcholine receptor subtype preferentially sensitive to biogenic amines"

-REST_*: Contains files for the replica exchange simulation with dopamine and bee alpha5 \n
    |--prepare_replicas.bash: Script to prepare topologies for the REST simulation \n
    |--md.mdp: Contains the parameters for the MD simulation \n
    |--npt.gro: Starting coordinates for the simulation \n
    |--equil: Contains the equilibration files and unmodified topologies for the system \n
    |--analysis \n
        |--cluster: RMSD based clustering of the \n
        |--unbiased: Conventional MD used for GBSA calculations \n
    |--0: Contains the files for the first replica (target temperautre 310K) \n
        |--topol0.top: Topology file for the replica 0 \n
        |--clean.xtc: Trajectory file for the replica 0 dt = 100ps / no solvent \n
        |--clean.gro: Coordinate file for the replica 0 no solvent \n
