class ActivitiesController < ApplicationController
    def new
       @activity = Activity.new
    end
    def create
        byebug
    end
end
