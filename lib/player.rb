# frozen_string_literal: true

class Player
    attr_accessor :marker
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  end