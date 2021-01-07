/datum/department/command
	goals = list(/datum/goal/department/paperwork/torch)
	name = "Command"
	flag = COM

var/list/torch_paperwork_spawn_turfs = list()
var/list/torch_paperwork_end_areas = list()

/obj/effect/landmark/paperwork_spawn_torch
	name = "Torch Paperwork Goal Spawn Point"

/obj/effect/landmark/paperwork_spawn_torch/Initialize()
	..()
	var/turf/T = get_turf(src)
	if(istype(T))
		global.torch_paperwork_spawn_turfs |= T
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/paperwork_finish_torch
	name = "Torch Paperwork Goal Finish Point"

/obj/effect/landmark/paperwork_finish_torch/Initialize()
	..()
	var/turf/T = get_turf(src)
	if(istype(T))
		var/area/A = get_area(T)
		if(istype(A))
			global.torch_paperwork_end_areas |= A
	return INITIALIZE_HINT_QDEL

/datum/goal/department/paperwork/torch
	paperwork_types =    list(/obj/item/paperwork/torch)
	signatory_job_list = list(/datum/job/captain, /datum/job/hop)

/datum/goal/department/paperwork/torch/get_spawn_turfs()
	return global.torch_paperwork_spawn_turfs

/datum/goal/department/paperwork/torch/get_end_areas()
	return global.torch_paperwork_end_areas

/obj/item/paperwork/torch
	name = "\improper SCG payroll paperwork"
	desc = "A complex list of salaries, hours and tax withheld for SolGov personnel this month."

/datum/department/command/Initialize()
	world.log << "g1 [json_encode(goals)]"
	. = ..()
	world.log << "g2 [json_encode(goals)]"