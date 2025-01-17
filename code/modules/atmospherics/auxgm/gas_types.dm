/datum/gas/oxygen
	id = GAS_O2
	specific_heat = 20
	name = "Oxygen"
	oxidation_temperature = T0C - 100 // it checks max of this and fire temperature, so rarely will things spontaneously combust
	powermix = 1
	heat_penalty = 1
	transmit_modifier = 1.5

/datum/gas/nitrogen
	id = GAS_N2
	specific_heat = 20
	name = "Nitrogen"
	powermix = -1
	heat_penalty = -1.5
	breath_alert_info = list(
		not_enough_alert = list(
			alert_category = "not_enough_nitro",
			alert_type = /atom/movable/screen/alert/not_enough_nitro
		),
		too_much_alert = list(
			alert_category = "too_much_nitro",
			alert_type = /atom/movable/screen/alert/too_much_nitro
		)
	)

/datum/gas/carbon_dioxide //what the fuck is this?
	id = GAS_CO2
	specific_heat = 30
	name = "Carbon Dioxide"
	powermix = 1
	heat_penalty = 0.1
	powerloss_inhibition = 1
	breath_results = GAS_O2
	breath_alert_info = list(
		not_enough_alert = list(
			alert_category = "not_enough_co2",
			alert_type = /atom/movable/screen/alert/not_enough_co2
		),
		too_much_alert = list(
			alert_category = "too_much_co2",
			alert_type = /atom/movable/screen/alert/too_much_co2
		)
	)
	fusion_power = 3
	enthalpy = -393500

/datum/gas/plasma
	id = GAS_PLASMA
	specific_heat = 200
	name = "Plasma"
	gas_overlay = "plasma"
	moles_visible = MOLES_GAS_VISIBLE
	flags = GAS_FLAG_DANGEROUS
	heat_penalty = 15
	transmit_modifier = 4
	powermix = 1
	// no fire info cause it has its own bespoke reaction for trit generation reasons
	enthalpy = FIRE_PLASMA_ENERGY_RELEASED // 3000000, 3 megajoules, 3000 kj

/datum/gas/water_vapor
	id = GAS_H2O
	specific_heat = 40
	name = "Water Vapor"
	gas_overlay = "water_vapor"
	moles_visible = MOLES_GAS_VISIBLE
	fusion_power = 8
	heat_penalty = 8
	powermix = 1
	breath_reagent = /datum/reagent/water
	heat_penalty = 12
	transmit_modifier = 2
	enthalpy = -241800 // FIRE_HYDROGEN_ENERGY_RELEASED is actually what this was supposed to be

/datum/gas/hypernoblium
	id = GAS_HYPERNOB
	specific_heat = 2000
	name = "Hyper-noblium"
	gas_overlay = "freon"
	moles_visible = MOLES_GAS_VISIBLE
	enthalpy = 81600

/datum/gas/nitrous_oxide
	id = GAS_NITROUS
	specific_heat = 40
	name = "Nitrous Oxide"
	gas_overlay = "nitrous_oxide"
	moles_visible = MOLES_GAS_VISIBLE * 2
	flags = GAS_FLAG_DANGEROUS
	fire_products = list(GAS_N2 = 1)
	oxidation_rate = 0.5
	oxidation_temperature = FIRE_MINIMUM_TEMPERATURE_TO_EXIST + 100
	heat_resistance = 6
	enthalpy = 33200

/datum/gas/nitryl
	id = GAS_NITRYL
	specific_heat = 20
	name = "Nitryl"
	gas_overlay = "nitryl"
	moles_visible = MOLES_GAS_VISIBLE
	flags = GAS_FLAG_DANGEROUS
	fusion_power = 15
	fire_products = list(GAS_N2 = 0.5)
	oxidation_temperature = FIRE_MINIMUM_TEMPERATURE_TO_EXIST - 50

/datum/gas/tritium
	id = GAS_TRITIUM
	specific_heat = 10
	name = "Tritium"
	gas_overlay = "tritium"
	moles_visible = MOLES_GAS_VISIBLE
	flags = GAS_FLAG_DANGEROUS
	fusion_power = 1
	powermix = 1
	heat_penalty = 10
	transmit_modifier = 30
	/*
	these are for when we add hydrogen, trit gets to keep its hardcoded fire for legacy reasons
	fire_provides = list(GAS_H2O = 2)
	fire_burn_rate = 2
	enthalpy = FIRE_HYDROGEN_ENERGY_RELEASED
	fire_temperature = FIRE_MINIMUM_TEMPERATURE_TO_EXIST - 50
	*/

/datum/gas/bz
	id = GAS_BZ
	specific_heat = 20
	name = "BZ"
	flags = GAS_FLAG_DANGEROUS
	fusion_power = 8
	powermix = 1
	heat_penalty = 5
	transmit_modifier = -2
	radioactivity_modifier = 5
	enthalpy = FIRE_CARBON_ENERGY_RELEASED // it is a mystery

/datum/gas/stimulum
	id = GAS_STIMULUM
	specific_heat = 5
	name = "Stimulum"
	fusion_power = 7

/datum/gas/pluoxium
	id = GAS_PLUOXIUM
	specific_heat = 80
	name = "Pluoxium"
	fusion_power = 10
	oxidation_temperature = FIRE_MINIMUM_TEMPERATURE_TO_EXIST * 1000 // it is VERY stable
	oxidation_rate = 8
	powermix = -1
	heat_penalty = -1
	transmit_modifier = -5
	heat_resistance = 3
	enthalpy = -50000 // but it reduces the heat output a bit
  
/datum/gas/miasma
	id = GAS_MIASMA
	specific_heat = 20
	fusion_power = 50
	name = "Miasma"
	gas_overlay = "miasma"
	moles_visible = MOLES_GAS_VISIBLE * 60

//NUCLEIUM Waste Gas from RBMK Nuclear Reactor	//Monkestation Edit
/datum/gas/nucleium
	id = GAS_NUCLEIUM
	specific_heat = 180 /// Default was 450
	name = "Nucleium"
	gas_overlay = "nucleium"
	moles_visible = MOLES_GAS_VISIBLE
	flags = GAS_FLAG_DANGEROUS
	fusion_power = 1


/datum/gas/hydrogen
	id = GAS_H2
	specific_heat = 15
	name = "Hydrogen"
	gas_overlay = "hydrogen"
	fusion_power = 1
	powermix = 1
	heat_penalty = 2
	transmit_modifier = 30

/datum/gas/freon
	id = GAS_FREON
	specific_heat = 300
	name = "Freon"
	gas_overlay = "freon"
	moles_visible = MOLES_GAS_VISIBLE *30
	fusion_power = -5
	heat_penalty = -10

/datum/gas/dilithium // Main point is that this helps fusion occur at a significantly lower temperature than normal
	id = GAS_DILITHIUM
	specific_heat = 55
	name = "Dilithium"
	fusion_power = 1

/datum/gas/healium
	id = GAS_HEALIUM
	specific_heat = 10
	name = "Healium"
	gas_overlay = "healium"
	moles_visible = MOLES_GAS_VISIBLE
	heat_penalty = 4
	transmit_modifier = 2.4

/datum/gas/pluonium
	id = GAS_PLUONIUM
	specific_heat = 30
	name = "Pluonium"
	flags = GAS_FLAG_DANGEROUS
	gas_overlay = "pluonium"
	moles_visible = MOLES_GAS_VISIBLE
	heat_resistance = 5
	transmit_modifier = 15

/datum/gas/halon
	id = GAS_HALON
	specific_heat = 175
	name = "Halon"
	flags = GAS_FLAG_DANGEROUS
	gas_overlay = "halon"
	moles_visible = MOLES_GAS_VISIBLE

/datum/gas/zauker
	id = GAS_ZAUKER
	specific_heat = 350
	name = "Zauker"
	flags = GAS_FLAG_DANGEROUS
	gas_overlay = "zauker"
	moles_visible = MOLES_GAS_VISIBLE

/datum/gas/hexane
	id = GAS_HEXANE
	specific_heat = 5
	name = "Hexane"
	flags = GAS_FLAG_DANGEROUS
	gas_overlay = "hexane"
	moles_visible = MOLES_GAS_VISIBLE
