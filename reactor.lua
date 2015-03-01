local turbines = {
   "BigReactors-Turbine_15",
   "BigReactors-Turbine_9",
   "BigReactors-Turbine_8",
   "BigReactors-Turbine_7",
   "BigReactors-Turbine_6",
   "BigReactors-Turbine_5",
   "BigReactors-Turbine_4",
   "BigReactors-Turbine_10",
   "BigReactors-Turbine_12",
   "BigReactors-Turbine_11",
   "BigReactors-Turbine_14",
   "BigReactors-Turbine_13",
}

local reactors = {
   "BigReactors-Reactor_11",
   "BigReactors-Reactor_10",
   "BigReactors-Reactor_13",
   "BigReactors-Reactor_12",
   "BigReactors-Reactor_14",
   "BigReactors-Reactor_8",
   "BigReactors-Reactor_7",
   "BigReactors-Reactor_6",
   "BigReactors-Reactor_5",
   "BigReactors-Reactor_4",
   "BigReactors-Reactor_3",
   "BigReactors-Reactor_9",
}

local myScr = peripheral.wrap("right")

local curReactor
local curTurbine

local i
myScr.setCursorPos(1,1)
myScr.clear()

while 1 do
   myScr.scroll(-1)
   myScr.setCusorPos(1,1)
   myScr.write("Index:"..i)
   curTurbine = peripheral.find( turbines[i] )
   curReactor = peripheral.find( reactors[i] )

   curTurbine.setActive(true)
   curReactor.setActive(true)
   sleep(1)

   curTurbine.setActive(false)
   curReactor.setActive(false)
   sleep(1)
   i=i+1
end