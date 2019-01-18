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

def exp(b, x)
    if x == 0
        return 1
    else
        return b*exp(b,x-1)
    end
end

def exp2(b, x)
    if x == 0
        return 1
    elsif x == 1
        return b
    elsif x % 2 == 0
        temp = exp2(b, x/2)
        return temp*temp
    else
        temp = exp2(b, (x-1)/2)
        return b*temp*temp
    end
end

class Array 
    def deep_dup
        dup = []
        self.each do |i|
            if i.is_a?(Array)
                dup << i.deep_dup
            else
                dup << i
            end
        end
        return dup
    end
end

def fib(n)
    if n == 1
        return [1]
    elsif n == 2
        return [1,1]
    else
        y = fib(n-1)
        return y + [y[-1]+y[-2]]
    end
end

def fib2(n)
    ans = []
    n.times do |i|
        if i == 0
            ans << 1
        elsif i == 1
            ans << 1
        else
            ans << ans[-1] + ans[-2]
        end
    end
    return ans
end

def bsearch(r, t)
    if r.length == 1
        if r[0] == t
            return 0
        else
            return nil
        end
    end
    mid = r[r.length/2]
    if t == mid
        return r.length/2
    elsif t < mid
        return bsearch(r[0...r.length/2],t)
    else
        return r.length/2 + 1 + bsearch(r[r.length/2 + 1..-1],t)
    end
end

def merge_sort(r)
    if r.length == 0
        return []
    elsif r.length == 1
        return r
    else
        x = merge(merge_sort(r[0...r.length/2]),merge_sort(r[r.length/2..-1]))
        return x
    end
end

def merge(r1, r2)
    r3 = []
    while r1.length != 0 && r2.length != 0
        if r1[0] < r2[0]
            r3 << r1.shift
        else
            r3 << r2.shift
        end
    end
    return r3 + r1 + r2
end

def subsets(r)
    if r.length == 0
        return [[]]
    else
        x = []
        subsets(r[0...-1]).each do |i|
            x << (i << r[-1])
        end
    end
    return subsets(r[0...-1]) + x
end

def permutations(r)
    x=[]
    if r.length == 0
    elsif r.length == 1
        x << r
    else
        permutations(r[0...-1]).each do |i|
            (i.length + 1).times do |j|
                x << i.deep_dup.insert(j,r[-1])
            end
        end
    end
    return x
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
    if amount == 0
        return []
    else
        x = []
        (amount/coins[0]).times {x << coins[0]}
        return x + greedy_make_change(amount % coins[0], coins[1..-1])
    end
end

def make_better_change(amount, coins = [25, 10, 5, 1])
    
end