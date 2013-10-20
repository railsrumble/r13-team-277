module TaskType
  extend ActiveSupport::Concern
  
  IMAGES = {
    homework: {
      keywords: ['assignment', 'report', 'homework'], 
      weight: 2.hours
    },
    cart: {
      keywords: ['buy', 'shop', 'grocery'],
      weight: 1.hour
    },
    book: {
      keywords: ['read', 'study', 'exam'],
      weight: 2.hours
    },
    phone: {
      keywords: ['call, phone'],
      weight: 10.minutes
    },
    email: {
      keywords: ['email'],
      weight: 5.minutes
    },
    people: {
      keywords: ['meet', 'people'],
      weight: 30.minutes
    },
    food: {
      keywords: ['cook', 'food', 'eat'],
      weight: 40.minutes
    },
    mop: {
      keywords: ['clean'],
      weight: 1.hour
    },
    tools: {
      keywords: ['fix', 'repair'],
      weight: 1.hour
    },
    heart: {
      keywords: ['date', 'love', 'flower', 'heart'],
      weight: 4.hours
    },
    zoom: {
      keywords: ['find', 'search'],
      weight: 20.minutes
    },
    run: {
      keywords: ['exercise', 'workout', 'gym'],
      weight: 30.minutes 
    },
    game: {
      keywords: ['play', 'game'],
      weight: 1.hour
    },
    sleep: {
      keywords: ['sleep', 'rest'],
      weight: 8.hours 
    },
    write: {
      keywords: ['write', 'blog'],
      weight: 2.hours
    },
    airplane: {
      keywords: ['travel', 'flight'],
      weight: 4.hours
    },
    cup: {
      keywords: ['drink'],
      weight: 5.minutes
    },
    print: {
      keywords: ['print'],
      weight: 1.minute
    },
    twitter: {
      keywords: ['facebook', 'twitter'],
      weight: 1.minute
    },
    laundry: {
      keywords: ['laundry'],
      weight: 2.hours
    },
    code: {
      keywords: ['code', 'program'],
      weight: 2.hours
    },
    none: {
      keywords: [],
      weight: 0
    }
  }
  
  def find_image(description)
    words = description.split(/[\s.,;\/\\\\]/)
    keywords = IMAGES.map{|k,v| v[:keywords]}.flatten
    matches = []
    keywords.each do |keyword|
      if description.index(keyword) != nil
        matches = matches + [keyword]
      end
    end
    image_lookup(matches)
  end
  
  def image_lookup(keyword)
    matches = []
    IMAGES.each do |image, keywords|
      matches << image.to_s unless (keywords[:keywords] & keyword).empty?
    end
    matches << "none" if matches.empty?
    matches = matches[1..4] if matches.length > 4
    return matches
  end
  
  def update_task_type
    self.task_type = find_image(self.description)
    self.weight = IMAGES[self.task_type.first.to_sym][:weight]
  end

  included do
    before_save :update_task_type
  end
  
end