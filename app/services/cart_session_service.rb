# frozen_string_literal: true

class CartSessionService
  def initialize(cart_id)
    @cart_id = cart_id
  end

  def add_item(item)
    $redis.hset(@cart_id, item[:id], item.to_json)
  end

  def remove_item(item_id)
    $redis.hdel(@cart_id, item_id)
  end

  def items
    $redis.hvals(@cart_id).map { |item| JSON.parse(item) }
  end
end
