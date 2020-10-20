
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name MIPSPrueba -dir "D:/GitHubRepos/TPSD2/MIPSPrueba/planAhead_run_3" -part xc6slx9csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/GitHubRepos/TPSD2/MIPSPrueba/mips.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/GitHubRepos/TPSD2/MIPSPrueba} }
set_property target_constrs_file "User Constraints File.ucf" [current_fileset -constrset]
add_files [list {User Constraints File.ucf}] -fileset [get_property constrset [current_run]]
link_design
