-- Mekanism Reactor Control Script
-- Monitors coolant (water), heated coolant (steam) and waste of a Mekanism fission reactor
-- and stops the reactor if the water level drops below 40% or any of the other goes above 80%.

r = peripheral.wrap("back")
 
while true do
    w = r.getCoolantFilledPercentage()
    s = r.getHeatedCoolantFilledPercentage()
    d = r.getWasteFilledPercentage()
    
    print("Water at   ", w * 100)
    print("Steam at   ", s * 100)
    print("Waste at   ", d * 100)
 
    should_run = true
        
    if w < 0.4 then
        print("Low water")
        should_run = false
    elseif s > 0.8 then
        print("High steam")
        should_run = false
    elseif d > 0.8 then
        print("High waste")
        should_run = false
    end
     
    if should_run ~= r.getStatus() then
        if should_run then
            print("Starting up")
            r.activate()
        else
            print("Stopping")
            r.scram()
        end
    end
    
    if should_run then
        sleep(0.5)
    else
        sleep(2)
    end
end
