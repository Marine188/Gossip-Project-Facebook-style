class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  # GET /gossips
  # GET /gossips.json
  def index
    @gossips = Gossip.all # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  # GET /gossips/1
  # GET /gossips/1.json
  def show
        # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  # GET /gossips/new
  def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  # GET /gossips/1/edit
  def edit
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  # POST /gossips
  # POST /gossips.json
  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(title: params[:title],content: params[:content],user: User.first) #() sont les données obtenues à partir du formulaire

    respond_to do |format|
      if @gossip.save # essaie de sauvegarder en base @gossip
        format.html { redirect_to gossips_path, notice: 'Gossip was successfully created.' } # si ça marche, il redirige vers la page d'index du site
      else
        format.html { render :new } # sinon, il render(ne fait qu'afficher une view tout en gardant les variables disponibles ) la view new (qui est celle sur laquelle on est déjà)
      end
    end
  end

  # PATCH/PUT /gossips/1
  # PATCH/PUT /gossips/1.json
  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to @gossip, notice: 'Gossip was successfully updated.' }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1
  # DELETE /gossips/1.json
  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to gossips_url, notice: 'Gossip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gossip_params
      params.fetch(:gossip, {})
    end
end
