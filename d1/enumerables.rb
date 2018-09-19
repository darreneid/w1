class Array
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
    self
  end

  def my_select
    selects = []
    self.my_each do |x|
      selects << x if yield(x)
    end
    selects
  end

  def my_reject
    rejects = []
    self.my_each do |x|
      rejects << x if !yield(x)
    end
    rejects
  end

  def my_any?
    bool = false
    self.my_each do |x|
      bool = true if yield(x)
    end
    bool
  end

  def my_all?
    bool = true
    self.my_each do |x|
      bool = false if !yield(x)
    end
    bool
  end

  def my_flatten
    flat = []
    self.my_each do |x|
      if x.is_a?(Array)
        flat += x.my_flatten
      else
        flat << x
      end
    end
    flat
  end

  def my_zip(*inp)
    zip = []
    self.length.times do |i|
      subzip = [self[i]]
      inp.my_each do |j|
        subzip << j[i]
      end
      zip << subzip
    end
    zip
  end

  def my_rotate(i = 1)
    rot = []
    rot += self
    if i > 0
      i.times do
        rot.push(rot.shift)
      end
    elsif i < 0
      (-i).times do
        rot.unshift(rot.pop)
      end
    end
    rot
  end

  def my_join(char = "")
    str = ""
    self.length.times do |i|
      str += self[i]
      str += char
    end
    str[0...-1]
  end

  def my_reverse
    rev = []
    self.length.times do |i|
      rev << self[self.length - 1 - i]
    end
    rev
  end

  def bubble_sort!
    self.length.times do |i|
      self.length.times do |j|
        if j == self.length-1
        elsif self[j] > self[j+1]
          self[j], self[j+1] = self[j+1], self[j]
        end
      end
    end
    self
  end

  def bubble_sort
    copy = self.dup
    copy.bubble_sort!
  end
end

def factors(num)
  factors = []
  num.times do |i|
    factors << (i+1) if num%(i+1) == 0
  end
  factors.uniq
  factors
end
