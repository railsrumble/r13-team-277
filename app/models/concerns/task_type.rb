module TaskType
  extend ActiveSupport::Concern
  
  IMAGES = {
    homework: ['assignment', 'report', 'homework'], 
    cart: ['buy', 'shop', 'grocery'],
    book: ['read', 'study', 'exam'],
    phone: ['call, phone'],
    email: ['email'],
    people: ['meet', 'people'],
    food: ['cook', 'food', 'eat'],
    mop: ['clean'],
    tools: ['fix', 'repair'],
    heart: ['date', 'love', 'flower', 'heart'],
    zoom: ['find', 'search'],
    run: ['exercise', 'workout', 'gym'],
    game: ['play', 'game'],
    sleep: ['sleep', 'rest'],
    write: ['write', 'blog'],
    airplane: ['travel', 'flight'],
    cup: ['drink'],
    print: ['print'],
    twitter: ['facebook', 'twitter'],
    laundry: ['laundry'],
    code: ['code', 'program']
  }
  
  def find_image(description)
    words = description.split(/[\s.,;\/\\\\]/)
    keywords = IMAGES.map{|k,v| v}.flatten
    matches = []
    keywords.each do |keyword|
      if description.index(keyword) != nil
        matches = matches + [keyword]
      end
    end
    image_lookup(matches.first)
  end
  
  def image_lookup(keyword)
    IMAGES.each do |image, keywords|
      return image.to_s if keywords.include? keyword
    end
    return "none"
  end
  
  def update_task_type
    self.task_type = find_image(self.description)
  end
  
  included do
    before_save :update_task_type
  end
  
end