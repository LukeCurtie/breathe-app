class JournalEntriesController < ApplicationController

  def index

    @journal_entries = JournalEntry.where(user: current_user).order(created_at: :desc)

  end


  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.user = current_user
    if @journal_entry.save
      redirect_to journal_entries_path
    else
      render :new
    end

  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])
    @journal_entry.user = current_user




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
    params.require(:journal_entry).permit(:title, :content)
  end


end
