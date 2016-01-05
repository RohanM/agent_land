module AgentGame
  class World
    GRASS = 0
    FOOD = 1
    ROCK = 2
    WATER = 3

    def initialize(width, height)
      @width, @height = width, height
      @diagonal = (((width**2) + (height**2)) ** 0.5).floor

      @data = Array.new(width) { Array.new(height) { GRASS } }
      populate
    end


    private

    def populate
      add FOOD, patches: 5, radius: 0.1
      add WATER, patches: 3, radius: 0.2
      add ROCK, patches: 3, radius: 0.2
    end

    def add(terrain, patches: 5, radius: 0.1)
      patches.times do
        x = Random.rand @width
        y = Random.rand @height
        r = (@diagonal * radius).floor
        puts "#{terrain} --> (#{x}, #{y}) x #{r}"
        add_circle terrain, x, y, r
      end
    end

    # https://en.wikipedia.org/wiki/Midpoint_circle_algorithm
    # TODO: Adapt to draw filled circles
    def add_circle(terrain, x0, y0, radius)
      x = radius
      y = 0
      decisionOver2 = 1 - x  # Decision criterion divided by 2 evaluated at x=r, y=0

      while y <= x do
        set_square  x + x0,  y + y0, terrain # Octant 1
        set_square  y + x0,  x + y0, terrain # Octant 2
        set_square -x + x0,  y + y0, terrain # Octant 4
        set_square -y + x0,  x + y0, terrain # Octant 3
        set_square -x + x0, -y + y0, terrain # Octant 5
        set_square -y + x0, -x + y0, terrain # Octant 6
        set_square  x + x0, -y + y0, terrain # Octant 8
        set_square  y + x0, -x + y0, terrain # Octant 7
        y += 1
      end

      if decisionOver2 <= 0
        decisionOver2 += 2 * y + 1   # Change in decision criterion for y -> y+1
      else
        x -= 1
        decisionOver2 += 2 * (y - x) + 1;   # Change for y -> y+1, x -> x-1
      end
    end

    def set_square(x, y, terrain)
      if x >= 0 && y >= 0 && x < @width && y < @height
        @data[x][y] = terrain
      end
    end

  end
end
