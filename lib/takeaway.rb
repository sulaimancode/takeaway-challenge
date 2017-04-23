require_relative 'menu'
require_relative 'messenger'
class Takeaway

attr_reader :menu, :current_order, :total

  def initialize(given_menu = Menu.new)
    @menu = given_menu
    @current_order = Hash.new(0)
  end

  def order(dish, quantity = 1)
    @current_order[dish] += quantity
  end

  def order_list
    list = []
    @current_order.each { |key, value| list << "#{value}x #{key} = £#{@menu.dishes[key] * value}" }
    puts list.join("\n")
    list.join("\n")
  end

  def show_total
    calculate_total
    "Total: £#{total}"
  end

  def calculate_total
    @total = 0
    @current_order.each { |key, value| @total +=  @menu.dishes[key] * value }
    @total
  end

  def complete_order(amount)
    fail 'please pay the correct amount' unless amount == @total
    Messenger.new.send_text
  end

end
