local mod = get_mod("grenades")

--[[projectile_info = Projectiles.grenade,
impact_data = {
    grenade = true,
	targets = 1,
	aoe = ExplosionTemplates.grenade
},
timed_data = {
	life_time = 3,
	aoe = ExplosionTemplates.grenade
},]]

-- Frag Grenade
--[[Projectiles.grenade = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1_3p",
	life_time = 3,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	rotate_around = true
}]]

DamageProfileTemplates.frag_grenade_t2 = table.clone(DamageProfileTemplates.frag_grenade)
DamageProfileTemplates.frag_grenade_t2.default_target.power_distribution.attack = 2.5 -- 1.5
DamageProfileTemplates.frag_grenade_t2.default_target.power_distribution.impact = 2.5 -- 2
table.create_copy(NewDamageProfileTemplates.fire_grenade_t2, DamageProfileTemplates.fire_grenade_t2)
DamageProfileTemplates.frag_grenade_t2_glance = table.clone(DamageProfileTemplates.frag_grenade)
DamageProfileTemplates.frag_grenade_t2_glance.default_target.power_distribution.attack = 1 -- 0.5
DamageProfileTemplates.frag_grenade_t2_glance.default_target.power_distribution.impact = 2 -- 1.5
table.create_copy(NewDamageProfileTemplates.frag_grenade_t2_glance, DamageProfileTemplates.frag_grenade_t2_glance)

ExplosionTemplates.grenade_t2 = {
    is_grenade = true,
    explosion = {
        dont_rotate_fx = true,
        radius = 7.5, --5
        max_damage_radius = 3, -- 2
        alert_enemies_radius = 20,
        sound_event_name = "player_combat_weapon_grenade_explosion",
        attack_template = "grenade",
        damage_profile_glance = "frag_grenade_t2_glance",
        alert_enemies = true,
        damage_profile = "frag_grenade_t2",
        effect_name = "fx/wpnfx_frag_grenade_impact",
        difficulty_power_level = {
            easy = {
                power_level_glance = 100,
                power_level = 200
            },
            normal = {
                power_level_glance = 200,
                power_level = 400
            },
            hard = {
                power_level_glance = 300,
                power_level = 600
            },
            harder = {
                power_level_glance = 400,
                power_level = 800
            },
            hardest = {
                power_level_glance = 500,
                power_level = 1000
            },
            survival_hard = {
                power_level_glance = 300,
                power_level = 600
            },
            survival_harder = {
                power_level_glance = 400,
                power_level = 800
            },
            survival_hardest = {
                power_level_glance = 500,
                power_level = 1000
            }
        },
        camera_effect = {
            near_distance = 5,
            near_scale = 1.5,
            shake_name = "frag_grenade_explosion",
            far_scale = 0.3,
            far_distance = 20
        }
    }
}

table.create_copy(NewExplosionTemplates.grenade_t2, ExplosionTemplates.grenade_t2)

Weapons.frag_grenade_t2.actions.action_one.throw.impact_data.aoe = ExplosionTemplates.grenade_t2
Weapons.frag_grenade_t2.actions.action_instant_throw_grenade.instant_throw.timed_data.aoe = ExplosionTemplates.grenade_t2
Weapons.frag_grenade_t2.actions.action_one.throw.projectile_info = Projectiles.grenade
Weapons.frag_grenade_t2.actions.action_instant_throw_grenade.instant_throw.projectile_info = Projectiles.grenade


-- Fire grenade

--[[Projectiles.grenade_fire_t2 = {
	impact_type = "sphere_sweep",
	radius = 0.1,
	show_warning_icon = true,
	trajectory_template_name = "throw_trajectory",
	pickup_name = "grenade",
	projectile_unit_name = "units/weapons/player/wpn_emp_grenade_03_t1/wpn_emp_grenade_03_t1_3p",
	life_time = 3,
	gravity_settings = "drakegun",
	projectile_unit_template_name = "player_projectile_unit",
	rotate_around = true
}]]

DamageProfileTemplates.fire_grenade_t2 = table.clone(DamageProfileTemplates.explosive_barrel)
DamageProfileTemplates.fire_grenade_t2.default_target.power_distribution.attack = 1 -- 0.75
DamageProfileTemplates.fire_grenade_t2.default_target.power_distribution.impact = 1 -- 1
table.create_copy(NewDamageProfileTemplates.fire_grenade_t2, DamageProfileTemplates.fire_grenade_t2)

ExplosionTemplates.fire_grenade_t2 = {
    is_grenade = true,
    explosion = {
        radius = 3, -- 2
        damage_type = "fire_grenade",
        max_damage_radius = 1.5, -- 1
        alert_enemies_radius = 15,
        damage_type_glance = "fire_grenade_glance",
        dont_rotate_fx = true,
        dot_template_name = "burning_1W_dot",
        sound_event_name = "fireball_big_hit",
        alert_enemies = true,
        damage_profile = "explosive_barrel",
        effect_name = "fx/wpnfx_fire_grenade_impact",
        difficulty_power_level = {
            easy = {
                power_level_glance = 50,
                power_level = 59
            },
            normal = {
                power_level_glance = 50,
                power_level = 50
            },
            hard = {
                power_level_glance = 75,
                power_level = 50
            },
            harder = {
                power_level_glance = 100,
                power_level = 100
            },
            hardest = {
                power_level_glance = 150,
                power_level = 200
            },
            survival_hard = {
                power_level_glance = 150,
                power_level = 300
            },
            survival_harder = {
                power_level_glance = 200,
                power_level = 400
            },
            survival_hardest = {
                power_level_glance = 250,
                power_level = 500
            }
        }
    },
    aoe = {
        dot_template_name = "burning_dot_fire_grenade",
        radius = 9, --6
        nav_tag_volume_layer = "fire_grenade",
        create_nav_tag_volume = true,
        attack_template = "fire_grenade_dot",
        sound_event_name = "player_combat_weapon_fire_grenade_explosion",
        damage_interval = 1,
        duration = 7.5, -- 5
        area_damage_template = "explosion_template_aoe",
        nav_mesh_effect = {
            particle_radius = 2,
            particle_name = "fx/wpnfx_fire_grenade_impact_remains",
            particle_spacing = 0.9
        }
    }
}

table.create_copy(NewExplosionTemplates.fire_grenade_t2, ExplosionTemplates.fire_grenade_t2)

Weapons.fire_grenade_t2.actions.action_one.throw.impact_data.aoe = ExplosionTemplates.fire_grenade_t2
Weapons.fire_grenade_t2.actions.action_instant_throw_grenade.instant_throw.timed_data.aoe = ExplosionTemplates.fire_grenade_t2
Weapons.fire_grenade_t2.actions.action_one.throw.projectile_info = Projectiles.grenade_fire
Weapons.fire_grenade_t2.actions.action_instant_throw_grenade.instant_throw.projectile_info = Projectiles.grenade_fire

-- Network Lookup

local i = #ExplosionTemplates
local lookup = ExplosionTemplates

for key, _ in pairs(NewExplosionTemplates) do
	i = i + 1
	lookup[i] = key
end

local i = #DamageProfileTemplates
local lookup = DamageProfileTemplates

for key, _ in pairs(NewDamageProfileTemplates) do
	i = i + 1
	lookup[i] = key
end