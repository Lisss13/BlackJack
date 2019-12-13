require_relative './user'

# Игрок
class Player < User

  def initialize(name)
    super
    validate!
  end

  private

  def validate!
    raise 'Name can`be null or empty' if name.nil? || name.empty?
  end

end
