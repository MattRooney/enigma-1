class Crack

  def tail_position(encrypted)
    remainder = encrypted.length % 4
    if remainder == 0
      rotation_a
    elsif remainder == 1
      rotation_b
    elsif remainder == 2
      rotation_c
    else
      rotation_d
    end

  end

  def
    character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',
                    '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']
  end

  def set_rotation_a

  end

  def set_rotation_b

  end

  def set_rotation_c

  end

  def set_rotation_d

  end

  def

end
