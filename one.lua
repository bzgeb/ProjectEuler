-- Easy Way
local sum = 0;
for i=1,999 do
    if (i % 3) == 0 or (i % 5) == 0 then
        sum = sum + i;
    end
end
print(sum)
sum = 0

-- Using Generators
function generator()
    local i = 0
    local ret = 0
    return function()
        while i < 1000 do
            if (i % 3) == 0 or (i % 5) == 0 then
                ret = i
                i = i + 1
                return ret
            else
                i = i + 1
            end
        end
        return nil
    end
end

for x in generator() do
    sum = sum + x
end
print(sum)

-- Using Gaussian Magic
sum = 0
sum = (3 * 333 * 334 * 0.5) + (5 * 199 * 200 * 0.5) - (15 * 66 * 67 * 0.5)
print(sum)
