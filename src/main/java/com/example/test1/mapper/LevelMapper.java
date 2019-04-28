package com.example.test1.mapper;

import com.example.test1.pojo.Level;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface LevelMapper {

    @Select("select * from level")
    List<Level> list();

    @Update("update level set name=#{name} where id=#{id}")
    int update(Level level);

    /*@Update("update level set check=#{check} where id=#{id}")
    int updateCheck(Level level);*/

    @Delete("delete from level where id=#{id}")
    void delete(int id);

    @Select("select * from level where id=#{id}")
    Level get(int id);

    @Insert("insert into level (name,cid) values (#{name},#{cid})")
    void add(Level level);
}
