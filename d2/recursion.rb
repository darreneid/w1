def my_range(x, y)
    if y < x
        return []
    else
        return [x] + my_range(x+1,y)
    end
end

def recursive_array_sum(x)
    if x.length == 1
        return x[0]
    else
        return x[0] + recursive_array_sum(x[1..-1])
    end
end

def iterative_array_sum(x)
    sum = 0
    x.each {|i| sum += i}
    sum
end