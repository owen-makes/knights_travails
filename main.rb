class Knight
  MOVE_OFFSETS = [
    [-2, -1], [-2, 1], [2, -1], [2, 1],
    [-1, -2], [1, -2], [-1, 2], [1, 2]
  ]

  def initialize(board_size = 8)
    @board_size = board_size
  end

  def minimum_moves(start, target)
    queue = [[start, 0, [start]]]  # [position, moves, path]
    visited = Set.new([start])

    until queue.empty?
      position, moves, path = queue.shift

      if position == target
        return "You made it in #{moves} moves!\nHere's your path #{path}"
      end

      possible_moves(position).each do |next_position|
        next if visited.include?(next_position)

        new_path = [path] << next_position
        queue << [next_position, moves + 1, new_path]
        visited.add(next_position)
      end
    end

    -1 # If target is unreachable
  end

  private

  def possible_moves(coord)
    MOVE_OFFSETS.map { |dx, dy| [coord[0] + dx, coord[1] + dy] }
                .select { |x, y| valid_position?(x, y) }
  end

  def valid_position?(x, y)
    x.between?(0, @board_size - 1) && y.between?(0, @board_size - 1)
  end
end

# Example usage
knight = Knight.new
start = [3, 3]
target = [6, 6]
puts knight.minimum_moves(start, target)