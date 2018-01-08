module ArticlesHelper
  private def articleParam
    params.require(:article).permit(:title, :text, :tag_list, :image)
  end
end
