/datum/component/material_container/proc/transfer_to_container(
	var/datum/material/mat,
	var/datum/component/material_container/T,
	amt = 1)

	if(!istype(mat))
		mat = SSmaterials._GetMaterialRef(mat)
	if(amt == 0 || !T || !mat)
		return FALSE
	if (amt<0)
		return T.transfer_to_container(mat, T, -amt)
	var/tr = min(amt, materials[mat], T.has_space(amt))
	if(tr)
		if(use_amount_mat(tr, mat))
			T.insert_amount_mat(tr, mat)
			return tr
	return FALSE
