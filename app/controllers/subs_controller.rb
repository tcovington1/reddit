class SubsController < ApplicationController
# * M odel - all the logic (sort, change) on the table or record, database retraints, associations
# * V iew - user interaction, front end, keep login to a minimum (logic should be in model)
# * C ontrollers - directs traffic, actions - what you can do on webpage
# *  routes

# what are the actions?  - these will have their own http request
# actions  -> HTTP Verbs
# * C reate -> POST
# * R ead -> GET
# * U pdate -> PUT / Patch
# * D estroy -> DELETE

# ! all actions must return a response
  # HTML XML JSON or redirects to an action that does
  #if you don't specify it defaults to html page of the action name
    # action.html.erb

#* Callbacks - perform login at certain actions
  # diff than model callbacks
  # before_action
  # after_action
  # skip_before_action
  # skip_after_action

  #*  example 
  # before_action :method_to_call - all method
  #                                 # except:
  # before_action :method_to_call, only: [:index, :show, :new]
  # do this to keep code DRY

  #* Partials (partial views) ex: navbar - common/ shared views. you see over and over like a navbar
# go through your READS first



# READ - GET
  #pages user will see and interact with
  # show records from the db on the pages

# THESE ALL RETURN SOMETHING

# ACTIONS

  # !pattern
  # ? index action - see all of the record for the table
      # ex: inside index action
      # !plural
  #!  @model_names = Model_name.all
      # gets all the records and set them to a variable

   #? show action - see a single record, this requires an ID  
    # need to find the record you are looking for
    # single case
    #! @model_name = Model_name.find(param[:id])
    # this finds a particular record and shows by the id 

    #? new action - display the new record form, creates the record in memory
      # singluar model name
      # ! @model_name = Model_name.new
      # only saves in memory, not database

      # ? edit action - displays the edit record form, need ID
      # single
      #! @model_name = Model_name.find(params[:id])


      # CRUD ACTIONS
  # Do CREATE / POST FIRST
  #  ? CREATE -create a record, from the new action
# @model_name = Model_name.new(model_name_params)

# if @model_name.save
#   do something
# else
#   render :new (takes them back to new form)
# end

# ? UPDATE / PUT Patch
# * update action, edit a record, fires off after edit form, requires an ID
#   @model_name = Model_name.find(params[:id])
#   once we find it we go to if else
#   if @model_name.udpates(model_name_params)
#     do SOMETHING
#   else
#     render :edit
#   end

# ? DESTROY / DELETE
# * destroy action -  deletes a record, it requires an ID
#  fist we need to find it
#  ! Model.name.find(params[:id]).destroy
#  do something like display message saying it was deleted

#   # model_name_params
#   this passes certain attr
#   ? what is model_name_params?
#   looks like:
#     it's in the 'private' portion. Cannot access outside

    # private
    #   def model_name_params
    #     params.require(:model_name).permit(:attr, :everything that table has)
    #                                       :age, :name
    #   end


    # for subs
    # model = Sub
  # before_action :set_sub, only: [:show, :edit, :update, :destroy]
  # puts this in the private
  def index
    # @model_names = Model_name.all
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    # difined sub_params before you forget in private
    # add logic
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    render partial: 'form'
    
  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
    # this pulls in the data from ID to edit it
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

  private
    def sub_params
       params.require(:sub).permit(:name)
    end

    # def set_sub

    # end
    # use it with @sub.destroy

end
