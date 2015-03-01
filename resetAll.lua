
for i=1,#turbines do
   myScr.scroll(-1)
   myScr.setCursorPos(1,1)
   myScr.write("Index:"..i)
   curTurbine = peripheral.find( "BigReactors-Turbine", function(name,object) return name==turbines[i] end )
   curReactor = peripheral.find( "BigReactors-Reactor", function(name,object) return name==reactors[i] end )

   curTurbine.setActive(true)
   curReactor.setAllControlRodLevels(100)
   curReactor.setActive(true)
end