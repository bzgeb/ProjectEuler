local f = assert(io.open("names.txt", "r"))
local contents = assert(f:read("*a"))

local word
local names = {}

for word in string.gmatch(contents, '%b""') do
    table.insert(names, string.sub(word, 2, -2))
end

function encode_string(_string)
    local encoded_string = {}
    for i in string.gmatch(_string, "%a") do
        table.insert(encoded_string, (string.byte(i) - 64))
    end
    return encoded_string
end

function name_value(name, rank)
    local encoded_name = encode_string(name)
    local value = 0
    for k,v in pairs(encoded_name) do
        value = value + v
    end
    return value * (rank or 1)
end

function concat(...)
    local result = {}
    for i=1,#arg do
        for k,v in pairs(arg[i]) do
            table.insert(result, v)
        end
    end

    return result
end

function quicksort(_array)
    if #_array <= 1 then
        return _array
    end

    local less, greater = {}, {}
    local pivot = _array[math.random(1, #_array)]
    
    for i=1,#_array do
        if _array[i] < pivot then
            table.insert(less, _array[i])
        elseif _array[i] > pivot then
            table.insert(greater, _array[i])
        end
    end
    return concat(quicksort(less), {pivot}, quicksort(greater))
end

local sorted_names = quicksort(names)
local result = 0

for k,v in pairs(sorted_names) do
    result = result + name_value(v, k)
end
print(result)
