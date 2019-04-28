package com.example.test1.pojo;

import java.util.List;

public class Level {
    private int id;

    private String name;

    private int cid;

    private int check;

    private List<Level> levels;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public List<Level> getLevels() {
        return levels;
    }

    public void setLevels(List<Level> levels) {
        this.levels = levels;
    }
}
