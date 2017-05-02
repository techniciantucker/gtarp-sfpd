Player = {}
Player.__index = Player
-- Meta table for Player
setmetatable(Player, {
    __call = function(self, Player)
        local self = {}
        self.head = 0
        self.hair = 0
        self.hair_txt = 0
        self.tshirt = 0
        self.tshirt_txt = 0
        self.jacket = 0
        self.jacket_txt = 0
        self.pants = 0
        self.pants_txt = 0
        self.shoes = 0
        self.shoes_txt = 0
        self.gloves = 0
        self.gloves_txt = 0
        self.accessory_1 = 0
        self.accessory_1_txt = 0
        self.accessory_2 = 0
        self.accessory_2_txt = 0
        self.accessory_3 = 0
        self.accessory_3_txt = 0
        self.accessory_4 = 0
        self.accessory_4_txt = 0

        return setmetatable(self, Player)
    end
})