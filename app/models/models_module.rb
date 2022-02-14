module InheritMethods 
    module ClassMethods
        def find_by_path(path, url)
            id = path.split(url).last.to_i 
            find_by_id(id) #implicit self
        end
    end
end