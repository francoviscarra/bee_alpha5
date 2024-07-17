# Simulation data for "Characterization of a novel nicotinic acetylcholine receptor subtype preferentially sensitive to biogenic amines"

-REST_*: Contains files for the replica exchange simulation with dopamine and bee alpha5
    |--prepare_replicas.bash: Script to prepare topologies for the REST simulation
    |--md.mdp: Contains the parameters for the MD simulation
    |--npt.gro: Starting coordinates for the simulation
    |--equil: Contains the equilibration files and unmodified topologies for the system
    |--analysis
        |--cluster: RMSD based clustering of the 
        |--unbiased: Conventional MD used for GBSA calculations
    |--0: Contains the files for the first replica (target temperautre 310K)
        |--topol0.top: Topology file for the replica 0
        |--clean.xtc: Trajectory file for the replica 0 dt = 100ps / no solvent
        |--clean.gro: Coordinate file for the replica 0 no solvent