
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize( discount = nil )
        @total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    def add_item( title, price, quantity = nil )
        if quantity != nil
            add_to_total = price * quantity
            count = 0
            while count < quantity
                self.items << title
                count += 1
            end
        else
            add_to_total = price
            self.items << title
        end
        
        self.last_transaction = add_to_total
        self.total += add_to_total
    end

    def apply_discount
        if discount != nil
            discount = (self.total * self.discount) / 100
            self.total = self.total - discount
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end