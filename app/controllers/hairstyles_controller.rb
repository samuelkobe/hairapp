class HairstylesController < ApplicationController
  
  # GET /hairstyles
  # GET /hairstyles.json
  def index
    @hairstyles = Hairstyle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hairstyles }
    end
  end

  # GET /hairstyles/1
  # GET /hairstyles/1.json
  def show
    @hairstyle = Hairstyle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hairstyle }
    end
  end

  # GET /hairstyles/new
  # GET /hairstyles/new.json
  def new
    @hairstyle = Hairstyle.new
    @hairstyle.count = 0 # value in forum is now initialized
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hairstyle }
    end
  end

  # GET /hairstyles/1/edit
  def edit
    @hairstyle = Hairstyle.find(params[:id])
  end

  # POST /hairstyles
  # POST /hairstyles.json
  def create
    @hairstyle = Hairstyle.new(params[:hairstyle])

    respond_to do |format|
      if @hairstyle.save
        format.html { redirect_to @hairstyle, notice: 'Hairstyle was successfully created.' }
        format.json { render json: @hairstyle, status: :created, location: @hairstyle }
      else
        format.html { render action: "new" }
        format.json { render json: @hairstyle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hairstyles/1
  # PUT /hairstyles/1.json
  def update
    @hairstyle = Hairstyle.find(params[:id])

    respond_to do |format|
      if @hairstyle.update_attributes(params[:hairstyle])
        format.html { redirect_to @hairstyle, notice: 'Hairstyle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hairstyle.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def vote
      if !@hairstyle = Hairstyle.find_by_id(params[:id])
        redirect_to root_url, notice: 'Please select at least one hairstyle'
      else
        @client_ip = request.remote_ip
         blacklist = Blacklist.where(:ip => @client_ip).order("created_at DESC").first
        if blacklist && blacklist.created_at > 1.day.ago
          @comeback = ((blacklist.created_at-1.day.ago)/3600).to_int
          redirect_to root_url, notice: "Looks like you've voted recently, come back in #{@comeback}hr(s)"
        else
          if @hairstyle = Hairstyle.find_by_id(params[:id])
            @hairstyle.increment('count')
            @hairstyle.save
            Blacklist.create(:ip => @client_ip, :hairstyle_id => params[:id])
            redirect_to root_url, notice: 'Thanks for voting! Come back in 24hrs and vote again.'
          end
        end
      end
    end

  # DELETE /hairstyles/1
  # DELETE /hairstyles/1.json
  def destroy
    @hairstyle = Hairstyle.find(params[:id])
    @hairstyle.destroy

    respond_to do |format|
      format.html { redirect_to hairstyles_url }
      format.json { head :no_content }
    end
  end  
end
