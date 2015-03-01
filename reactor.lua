-- V1.0.1
local turbines = {
   "BigReactors-Turbine_15", --#1
   "BigReactors-Turbine_4", --#2
   "BigReactors-Turbine_5", --#3
   "BigReactors-Turbine_6", --#4
   "BigReactors-Turbine_7", --#5
   "BigReactors-Turbine_8", --#6
   "BigReactors-Turbine_9", --#7
   "BigReactors-Turbine_10", --#8
   "BigReactors-Turbine_11", --#9
   "BigReactors-Turbine_12", --#10
   "BigReactors-Turbine_13", --#11
   "BigReactors-Turbine_14", --#12
}

local reactors = {
   "BigReactors-Reactor_3", --#1
   "BigReactors-Reactor_4", --#2
   "BigReactors-Reactor_5", --#3
   "BigReactors-Reactor_6", --#4
   "BigReactors-Reactor_7", --#5
   "BigReactors-Reactor_8", --#6
   "BigReactors-Reactor_10", --#7
   "BigReactors-Reactor_9", --#8
   "BigReactors-Reactor_12", --#9
   "BigReactors-Reactor_11", --#10
   "BigReactors-Reactor_14", --#11
   "BigReactors-Reactor_13", --#12
}

local myScr = peripheral.wrap("right")

local curReactor
local curTurbine

local i = 1
myScr.setCursorPos(1,1)
myScr.clear()

while 1 do
   for i=1,#turbines do
      myScr.scroll(-1)
      myScr.setCursorPos(1,1)
      myScr.write("Index:"..i)
      print(turbines[i])
      print(reactors[i])
      curTurbine = peripheral.find( "BigReactors-Turbine", function(name,object) return name==turbines[i] end )
      curReactor = peripheral.find( "BigReactors-Reactor", function(name,object) return name==reactors[i] end )

      curTurbine.setActive(true)
      curReactor.setAllControlRodLevels(99)
      --curReactor.setActive(false)
   end
   sleep(1)
   break
end