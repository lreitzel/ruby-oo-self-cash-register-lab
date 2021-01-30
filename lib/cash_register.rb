class CashRegister
    attr_accessor :total, :discount, :last_transaction
    attr_reader :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(item, price, quantity = 1)
        self.total += price * quantity
        quantity.times do
            items << item
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        self.total = @total - total * @discount/100
        if discount > 0
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items=(list)
        @items = list
    end
    
    def void_last_transaction
        self.total -= last_transaction
    end
end
