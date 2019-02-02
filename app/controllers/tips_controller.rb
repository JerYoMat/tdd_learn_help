class TipsController < ApplicationController
    before_action :logged_in_user, except: [:show, :index, :destroy ]
    

    def new
      @tip = Tip.new 
      @lesson_list = LessonTopic.all.map{|l| [l.name, l.id]}.unshift(['', -1])    
    end 
  
    def create 
        @tip = current_user.tips.build(tip_params)
        if @tip.save
          flash[:success] = "Thanks! Your tip has been added."
          redirect_to @tip
        else
          @lesson_list = LessonTopic.all.map{|l| [l.name, l.id]}.unshift(['', -1])    
          @user = current_user
          render 'tips/new'
        end 
    end 
  
    def edit 
      correct_user 


    end
  
    def update 
    end 
  
    def index 
    end 
  
    def show 
    end 
  
    def destroy 
    end 


private 

def set_tip
  @tip = Tip.find(params[:id])
end 

def tip_params
    params.require(:tip).permit(:name, :description, :lesson_topic_id, :link, :user_id, :lesson_outcome)
end
end


