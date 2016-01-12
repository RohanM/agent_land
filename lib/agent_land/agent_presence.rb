module AgentLand
  class AgentPresence
    attr_accessor :x, :y

    def placed?
      x.present? && y.present?
    end
  end
end
