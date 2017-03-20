function wolfpop(wolf, elk, coyote) 
    idealWolfPop = 0
    for i=(1:1:30)
        if(elk(301,i)>(elk(1,i)*.7))
            if(coyote(301,i)>(coyote(1,i)*.5))
                idealWolfPop = i
                endElk = elk(301,i)
                endCoyote = coyote(301,i)
            end
        end
    end
end