class JournalEntriesController < ApplicationController

  def index

    @journal_entries = JournalEntry.all

  end


  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.user = current_user
    if @journal_entry.save
      redirect_to @journal_entry
    else
      render :new
    end

  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])
    @journal_entry.user = current_user
  end




  def update
    @journal_entry = JournalEntry.find(params[:id])

    @journal_entry.update(journal_entry_params)
    redirect_to journal_entries_show_path(@journal_entry)
  end



  def show
    @journal_entry = JournalEntry.find(params[:id])


  end


  def destroy
    @journal_entry = JournalEntry.find(params[:id])
    @journal_entry.destroy
    redirect_to journal_entries_path
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:title, :content, :photo)
  end


end
