USE vk;

ALTER TABLE `vk`.`profiles` 
CHANGE COLUMN `photo_id` `photo_id` INT(10) UNSIGNED NULL ;

ALTER TABLE `vk`.`posts` 
CHANGE COLUMN `communitie_id` `communitie_id` INT(10) UNSIGNED NULL ;

-- 1 Для таблицы профилей
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
 ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL,
  ADD CONSTRAINT profiles_region_id_fk
    FOREIGN KEY (region_id) REFERENCES regions(id)
      ON DELETE SET NULL;
      
-- 2 Для таблицы сообщений
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
    
-- 3 Для таблицы post
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT post_communitie_id_fk
    FOREIGN KEY (communitie_id) REFERENCES communities(id)
    ON DELETE SET NULL;
  
 -- 4 Для таблицы likes
 ALTER TABLE likes
 ADD CONSTRAINT like_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT target_like_id_fk
    FOREIGN KEY (target_id) REFERENCES users(id)
    ON DELETE CASCADE,
     ADD CONSTRAINT target_like_id_media_fk
    FOREIGN KEY (target_id) REFERENCES media(id)
    ON DELETE CASCADE,
      ADD CONSTRAINT target_like_id_post_fk
    FOREIGN KEY (target_id) REFERENCES posts(id)
    ON DELETE CASCADE,
     ADD CONSTRAINT target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
    
-- 5 Для таблицы media
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
     ON DELETE CASCADE,
     ADD CONSTRAINT media_type_id_fk
     FOREIGN KEY (media_type_id) REFERENCES media_types(id);
 
 # -- 6 Для таблицы friendship
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
     ON DELETE CASCADE,
     ADD CONSTRAINT friendship_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
     ON DELETE SET NULL; 
  
 -- 7 Для таблицы communities_users
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
     ON DELETE CASCADE,
     ADD CONSTRAINT community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
     ON DELETE CASCADE;
 
   
     
 

 
    

