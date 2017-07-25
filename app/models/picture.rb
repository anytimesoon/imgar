class Picture < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :picture_tags
	has_many :tags, through: :picture_tags

	has_attached_file :path, styles: { medium: "500x500>", small: "300x300>", thumb: "100x100>" }, 
										default_url: "/images/:style/missing.png",
										path: ":rails_root/app/assets/images/:username/:style/:basename.:extension",
										url: ":username/:style/:basename.:extension"

	Paperclip.interpolates('username') do |attachment, style|
		attachment.instance.user.name
	end

	validates :path, presence: true
  validates_attachment_content_type :path, content_type: /\Aimage\/.*\z/

  def tags_attributes=(tag_names)
		names = tag_names['0']['name'].split(', ')

    names.each do |name|
    	stripped_name = strip_tag_name(name)
      tag = Tag.find_or_create_by(name: stripped_name)

      self.tags << tag
    end
  end

  private

  def strip_tag_name(tag_name)
  	tag_name.gsub(/[.!?();:%$@*&{}|^\[\]`#~\/\\]/, '')
  end

end
