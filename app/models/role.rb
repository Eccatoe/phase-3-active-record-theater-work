class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.all.map {|a| a.actor}
    end

    def locations
        self.auditions.all.map {|a| a.location}
    end

    def lead
        self.auditions.find_by(hired: true)
    end

    def understudy
        hired=self.auditions.where(hired: true)
        if !hired[1]
            "no actor has been hired for understudy for this role"
        else hired[1]
        end
    
    end

end