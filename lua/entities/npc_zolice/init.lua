AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

//ENT.Model = "models/arachnid.mdl"
ENT.health = 240
ENT.Alerted = false
ENT.Territorial = false
ENT.Bleeds = true
ENT.Leaps = false
ENT.Chasing = false
ENT.Flinches = true
ENT.FriendlyToPlayer = false
ENT.Damage = 15
ENT.AcidBlood = true
ENT.BleedsRed = true
//ENT.LeapDamage = 15
ENT.LeapSpeed = 1000
ENT.LeapDistance = 300
ENT.MinLeapDistance = 200
ENT.MeleeAttacking = false;
ENT.Leaping = false
ENT.alert1 = Sound("zolice/alert1.wav")
ENT.alert2 = Sound("zolice/alert2.wav")
ENT.alert3 = Sound("zolice/alert3.wav")
ENT.alert4 = Sound("zolice/alert1.wav")
ENT.alert5 = Sound("zolice/alert3.wav")
ENT.alert6 = Sound("zolice/alert2.wav")
ENT.idle1 = Sound("zolice/idle1.wav")
ENT.idle2 = Sound("zolice/idle2.wav")
ENT.idle3 = Sound("zolice/idle3.wav")
ENT.idle4 = Sound("zolice/idle5.wav")
ENT.idle5 = Sound("zolice/idle4.wav")
ENT.idle6 = Sound("zolice/idle6.wav")
ENT.attack1 = Sound("zolice/claw_strike1.wav")
ENT.attack2 = Sound("zolice/claw_strike2.wav")
ENT.attack3 = Sound("zolice/claw_strike3.wav")
ENT.attack4 = Sound("zolice/claw_strike2.wav")
ENT.attack5 = Sound("zolice/claw_strike3.wav")
ENT.attack6 = Sound("zolice/claw_strike1.wav")
ENT.attackmiss1 = Sound("zolice/claw_miss1.wav")
ENT.attackmiss2 = Sound("zolice/claw_miss2.wav")
ENT.attackleap = Sound("")
ENT.hurt1 = Sound("zolice/pain1.wav")
ENT.hurt2 = Sound("zolice/pain2.wav")
ENT.hurt3 = Sound("zolice/pain3.wav")
ENT.hurt4 = Sound("zolice/pain4.wav")
ENT.hurt5 = Sound("zolice/pain1.wav")
ENT.hurt6 = Sound("zolice/pain2.wav")
ENT.hurt7 = Sound("zolice/pain3.wav")
ENT.hurt8 = Sound("zolice/pain4.wav")
ENT.hurt9 = Sound("zolice/pain1.wav")
ENT.hurt10 = Sound("zolice/pain2.wav")
ENT.die1 = Sound("zolice/die1.wav")
ENT.die2 = Sound("zolice/die2.wav")
ENT.die3 = Sound("zolice/die3.wav")
ENT.die4 = Sound("zolice/die4.wav")
ENT.die5 = Sound("zolice/die1.wav")
ENT.dead = false

local schedJump = ai_schedule.New( "Jump" ) 
schedJump:EngTask( "TASK_PLAY_SEQUENCE", ACT_JUMP )

function ENT:Initialize()
	local modelchoice = math.random(1,9)
	if modelchoice == 1 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 2 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 3 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 4 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 5 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 6 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 7 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 8 then
	self.Model = "models/zombie_police.mdl"
	elseif modelchoice == 9 then
	self.Model = "models/zombie_police.mdl"
	end
   self:SetModel( self.Model )
   self:SetHullType( HULL_MEDIUM )
   self:SetHullSizeNormal()
   self:SetSolid( SOLID_BBOX )
   self:SetMoveType( MOVETYPE_STEP )
   self:CapabilitiesAdd( CAP_MOVE_GROUND | CAP_SQUAD )
   self:SetMaxYawSpeed( 5000 )
   self:SetHealth(self.health)
end

function ENT:Think()
        //---------------
	local function setmeleefalse()
		if self:Health() < 0 then return end
		self.MeleeAttacking = false
		self.Leaping = false
		self:SetSchedule(SCHED_CHASE_ENEMY)
	end
        //---------------
	local function Attack_Melee()
		if self:Health() < 0 then return end
		local entstoattack = ents.FindInSphere(self:GetPos() + self:GetForward()*75,47)
		local hit = false
		if entstoattack != nil then
			for _,v in pairs(entstoattack) do
				if ( (v:IsNPC() || ( v:IsPlayer() && v:Alive())) && (v != self) && (v:GetClass() != self:GetClass()) || (v:GetClass() == "prop_physics")) then
					v:TakeDamage( self.Damage, self ) 
					if v:IsPlayer() then
						v:ViewPunch(Angle(math.random(-1,1)*self.Damage,math.random(-1,1)*self.Damage,math.random(-1,1)*self.Damage))
					end
					if v:GetClass() == "prop_physics" then
						local phys = v:GetPhysicsObject()
						if phys != nil && phys != NULL then
							phys:ApplyForceOffset(self:GetForward()*1000,Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1)))
						end
					end
					hit = true
				end
			end
		end
		local randomsound = math.random(1,4)
		if hit == false then
			self:StopSound(self.idle1)
			self:StopSound(self.idle2)
			self:StopSound(self.idle3)
			self:StopSound(self.idle4)
			
			if randomsound == 1 then
	      		self:EmitSound( self.attackmiss1,500,math.random(80,100))
			elseif randomsound == 2 then
	      		self:EmitSound( self.attackmiss2,500,math.random(80,100))
			elseif randomsound == 3 then
	      		self:EmitSound( self.attackmiss1,500,math.random(80,100))
			elseif randomsound == 4 then
	      		self:EmitSound( self.attackmiss2,500,math.random(80,100))
			end
		else
			local randomsound = math.random(1,6)
			//make the sound
			self:StopSound(self.idle1)
			self:StopSound(self.idle2)
			self:StopSound(self.idle3)
			self:StopSound(self.idle4)

			if randomsound == 1 then
	      		self:EmitSound( self.attack1,500,math.random(80,100))
			elseif randomsound == 2 then
	      		self:EmitSound( self.attack2,500,math.random(80,100))
			elseif randomsound == 3 then
	      		self:EmitSound( self.attack3,500,math.random(80,100))
			elseif randomsound == 4 then
	      		self:EmitSound( self.attack4,500,math.random(80,100))
			elseif randomsound == 5 then
	      		self:EmitSound( self.attack5,500,math.random(80,100))
			elseif randomsound == 6 then
	      		self:EmitSound( self.attack6,500,math.random(80,100))
			end
		end
		timer.Create( "melee_done_timer" .. self.Entity:EntIndex( ), 0.5, 1, setmeleefalse )
	end
        //---------------


    //---------------
    if GetConVarNumber("ai_disabled") == 0 then
		if math.random(1,5) == 1 then
			if self:GetEnemy() != nil then
				self:UpdateEnemyMemory(self:GetEnemy(),self:GetEnemy():GetPos())
			end
		end

		//make the sound
		local randomsound = math.random(1,120)
		if randomsound == 1 then
			self:StopSound(self.idle1)
			self:StopSound(self.idle2)
			self:StopSound(self.idle3)
			self:StopSound(self.idle4)
	      		//self:EmitSound( self.idle1,500,math.random(80,100))
		elseif randomsound == 2 then
			self:StopSound(self.idle1)
			self:StopSound(self.idle2)
			self:StopSound(self.idle3)
			self:StopSound(self.idle4)
	      		self:EmitSound( self.idle2,500,math.random(80,100))
		elseif randomsound == 3 then
			self:StopSound(self.idle1)
			self:StopSound(self.idle2)
			self:StopSound(self.idle3)
			self:StopSound(self.idle4)
	      		self:EmitSound( self.idle3,500,math.random(80,100))
		elseif randomsound == 4 then
			self:StopSound(self.idle1)
			self:StopSound(self.idle2)
			self:StopSound(self.idle3)
			self:StopSound(self.idle4)
	      		self:EmitSound( self.idle4,500,math.random(80,100))
		end
		if math.random(1,10) == 1 then
			//print( "Think start" );
			//Get all the npc's and other entities.
			local enttable = ents.FindByClass("npc_*")
			local monstertable = ents.FindByClass("monster_*")
			table.Add(monstertable,enttable)//merge

			//sort through each ent.
			for _, x in pairs(monstertable) do
				if (!ents) then print( "No Entities!" ); return end
				if (x:GetClass() != self:GetClass() && x:GetClass() != "npc_grenade_frag" && x:IsNPC()) then
					x:AddEntityRelationship( self, 1, 10 )
				end
			end
			
			local friends = ents.FindByClass("npc_zombie")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end
			local friends = ents.FindByClass("npc_zombine")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end	
			local friends = ents.FindByClass("npc_fastzombie")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end	
			local friends = ents.FindByClass("npc_headcrab")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end	
			local friends = ents.FindByClass("npc_headcrab_black")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end			
			local friends = ents.FindByClass("npc_headcrab_fast")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end	
			local friends = ents.FindByClass("npc_poisonzombie")
			for _, x in pairs(friends) do
				x:AddEntityRelationship( self, 3, 10 )
			end	
		end

		if self.TakingCover == false then
			if(math.random(1,6) == 1) then
			self:FindCloseEnemies()//get guys close to me
			end
		end//Hit them.
		
		if self:GetEnemy() != nil then
				if math.random(1,15) == 1 && self:GetPos():Distance(self:GetEnemy():GetPos()) < self.LeapDistance && self:GetPos():Distance(self:GetEnemy():GetPos()) > self.MinLeapDistance && self.Leaps == true && self.Leaping == false then
					self:SetSchedule(schedJump)
					self.Leaping = true
  					self:SetVelocity( (self:GetEnemy():GetPos()-self:GetPos() + Vector(0,0,50)):Normalize() * self.LeapSpeed )
					timer.Simple(0.25,setmeleefalse)
				end
				if (self:GetEnemy():GetPos():Distance(self:GetPos()) < 70) || self:HasPropInFrontOfMe() then
					if self.MeleeAttacking == false then
						if self.Leaping == false then
							self:SetSchedule( SCHED_MELEE_ATTACK1 )
						else
							self:EmitSound( self.attackleap)
							self:SetLocalVelocity( Vector( 0, 0, 0 ) )
						end
						timer.Create( "melee_attack_timer" .. self.Entity:EntIndex( ), 0.6, 1, Attack_Melee )
						self.MeleeAttacking = true;
					end
				end
		else
			self:FindEnemyDan()
			self.MeleeAttacking = false
		end
    end
    //---------------
    //print(self:GetEnemy())
    //print(self.Alerted)
    //print(self.Chasing)

end

function ENT:HasPropInFrontOfMe()
	local entstoattack = ents.FindInSphere(self:GetPos() + self:GetForward()*75,47)
	for _,v in pairs(entstoattack) do
		if v:GetClass() == "prop_physics" then
		return true
		end
	end
	return false
end

function ENT:SelectSchedule()
	if self:GetEnemy() != nil then
	if self:GetEnemy():GetPos():Distance(self:GetPos()) > 2600 then
		self:SetSchedule(SCHED_CHASE_ENEMY )
		self:SetEnemy(NULL)
		alerted = true
	end
	end

	local function setleapfalse()
		self.Leaping = true
	end
	
	if self:GetEnemy() != nil then
		if self:GetEnemy():GetPos():Distance(self:GetPos()) < 2000 then
			self:UpdateEnemyMemory(self:GetEnemy(),self:GetEnemy():GetPos())
			self:SetSchedule(SCHED_CHASE_ENEMY)
			self.Chasing = true
		else
			self:SetSchedule(SCHED_IDLE_WANDER)
		end
	elseif self.Alerted == true then
		self:SetSchedule(SCHED_IDLE_WANDER)
	else
		self:SetSchedule(SCHED_IDLE_WANDER)
	end
end

function ENT:OnTakeDamage(dmg)
   //if (self.TakingCover == false) && self.Flinches == true then
   //	self:SetSchedule(SCHED_SMALL_FLINCH)//
   //end 
   if self.Bleeds == true then
	self:SpawnBlood(dmg)
   end
   self:SetHealth(self:Health() - dmg:GetDamage())
   if math.random(4) == 1 then
	self:StopSound(self.idle1)
	self:StopSound(self.idle2)
	self:StopSound(self.idle3)
	self:StopSound(self.idle4)
	local sound_seed = math.random(1,7)
	if sound_seed == 1 then
	self:EmitSound( self.hurt1,500,math.random(80,100))
	elseif sound_seed == 2 then
	self:EmitSound( self.hurt2,500,math.random(80,100))
	elseif sound_seed == 3 then
	self:EmitSound( self.hurt3,500,math.random(80,100))
	end	
   end
   if dmg:GetAttacker():GetClass() != self:GetClass() && math.random(1,7) == 1 then
   	self:ResetEnemy()
   	self:AddEntityRelationship( dmg:GetAttacker(), 1, 10 )
   	self:SetEnemy(dmg:GetAttacker())
	self:SetSchedule(SCHED_CHASE_ENEMY)
	self.Chasing = true
   end
   if self:Health() <= 0 && self.dead == false then //run on death	
	self.dead = true;
	//print("DIED!!!")
	self:KilledDan()
   end
end

function ENT:FindEnemyDan()
	local MyNearbyTargets = ents.FindInCone(self:GetPos(),self:GetForward(),4000,45)
	if (!MyNearbyTargets) then print( "No Targets!" ); return end
	for k,v in pairs(MyNearbyTargets) do
	    if v:Disposition(self) == 1 || v:IsPlayer() then
		self:ResetEnemy()
   		self:AddEntityRelationship( v, 1, 10 )
	      	self:SetEnemy(v)
		self:UpdateEnemyMemory(v,v:GetPos())
		local distance = self:GetPos():Distance(v:GetPos())
	      	local randomsound = math.random(1,5)
		if self.Alerted == false then
			if randomsound == 1 then
	      		self:EmitSound( self.alert1)
			elseif randomsound == 2 then
	      		self:EmitSound( self.alert2)
			elseif randomsound == 3 then
	      		self:EmitSound( self.alert3)
			end
		end
		self.Alerted = true
	      	return
	    end
	end
	//if ClosestDistance == 4000 then
	//self:SetEnemy(NULL)
	//end
end


function ENT:ResetEnemy()
	local enttable = ents.FindByClass("npc_*")
	local monstertable = ents.FindByClass("monster_*")
	table.Add(monstertable,enttable)//merge

	//sort through each ent.
	for _, x in pairs(monstertable) do
		//print(x)
		if (!ents) then print( "No Entities!" ); return end
		if (x:GetClass() != self:GetClass()) then
			self:AddEntityRelationship( x, 2, 10 )
		end
	end
	self:AddRelationship("player D_NU 10")
end


function ENT:FindCloseEnemies()
	local MyNearbyTargets = ents.FindInCone(self:GetPos(),self:GetForward(),250,45)
	//local ClosestDistance = 3000
	if (!MyNearbyTargets) then print( "No Targets!" ); return end
	for k,v in pairs(MyNearbyTargets) do
	    if v:Disposition(self) == 1 || v:IsPlayer() then
		print(v:GetClass())

		self:ResetEnemy()
   		self:AddEntityRelationship( v, 1, 10 )
	      	self:SetEnemy(v)
		
		self.Alerted = true
	      	return
	    end
	end
end


function ENT:HasLOS()
	if self:GetEnemy() != nil then
	//local shootpos = self:GetAimVector()*(self:GetPos():Distance(self:GetEnemy():GetPos())) + self:GetPos()
	//local shootpos = self:GetEnemy():GetPos()
	local tracedata = {}

	tracedata.start = self:GetPos()
	tracedata.endpos = self:GetEnemy():GetPos()
	tracedata.filter = self

	local trace = util.TraceLine(tracedata)
	if trace.HitWorld == false then
		print("returned true!")
		return true
	else 
		return false
	end
	end
	print ("no enemy!")
	return false
end


function ENT:SpawnBlood(dmg)
   if self.AcidBlood then
	local entstoattack = ents.FindInSphere(self:GetPos(),75)
	for _,v in pairs(entstoattack) do
		if ( (v:IsNPC() || ( v:IsPlayer() && v:Alive())) && (v != self) && (v:GetClass() != self:GetClass()) || (v:GetClass() == "prop_physics")) then
			v:TakeDamage( 3, self ) 
		end
	self:EmitSound( "alien/alien_acid.wav" )
	end
   end
   if (self.Bleeds == true) then
   	local bloodeffect = ents.Create( "info_particle_system" )
	if self.BleedsRed == true then
   		bloodeffect:SetKeyValue( "effect_name", "blood_impact_red_01" )
	else
		bloodeffect:SetKeyValue( "effect_name", "blood_impact_yellow_01")
	end
        bloodeffect:SetPos( dmg:GetDamagePosition() ) 
	bloodeffect:Spawn()
	bloodeffect:Activate() 
	bloodeffect:Fire( "Start", "", 0 )
	bloodeffect:Fire( "Kill", "", 0.1 )
   end
   
end

function ENT:KilledDan()
	/*I Took some of silverlan's code for ragdolling, cause I didn't want to recode it :P*/
	//emit cry of death
	self:StopSound(self.idle1)
	self:StopSound(self.idle2)
	self:StopSound(self.idle3)
	self:StopSound(self.idle4)

	local deathseed = math.random(1,3)
	if     deathseed == 1 then
	  self:EmitSound( self.die1,500,math.random(80,100))
	elseif deathseed == 2 then
	  self:EmitSound( self.die2,500,math.random(80,100))
	elseif deathseed == 3 then
	  self:EmitSound( self.die3,500,math.random(80,100))
	end

	//create ragdoll
	local ragdoll = ents.Create( "prop_ragdoll" )
	ragdoll:SetModel( self:GetModel() )
	ragdoll:SetPos( self:GetPos() )
	ragdoll:SetAngles( self:GetAngles() )
	ragdoll:Spawn()
	ragdoll:SetSkin( self:GetSkin() )
	ragdoll:SetColor( self:GetColor() )
	ragdoll:SetMaterial( self:GetMaterial() )
	
	//my code
	undo.ReplaceEntity(self,ragdoll)
	cleanup.ReplaceEntity(self,ragdoll)

	//ignight ragdoll if on fire.
	if self:IsOnFire() then ragdoll:Ignite( math.Rand( 8, 10 ), 0 ) end

	//position bones the same way.
        for i=1,128 do
		local bone = ragdoll:GetPhysicsObjectNum( i )
		if ValidEntity( bone ) then
			local bonepos, boneang = self:GetBonePosition( ragdoll:TranslatePhysBoneToBone( i ) )
			bone:SetPos( bonepos )
			bone:SetAngle( boneang )
		end
	end
	if( GetConVarNumber("ai_keepragdolls") == 0 ) then
		ragdoll:SetCollisionGroup( 1 )//COLLISION_GROUP_DEBRIS )
		ragdoll:Fire( "FadeAndRemove", "", 7 )
	end
	self:Remove()
end