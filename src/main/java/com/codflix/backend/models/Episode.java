package com.codflix.backend.models;

public class Episode {
    private int id;
    private int media_id;
    private int season_number;
    private int episode_number;
    private String title;
    private String trailer_url;
    private int duration;

    public Episode(int id, int media_id, int season_number, int episode_number, String title,
                   String trailer_url, int duration) {
        this.id = id;
        this.media_id = media_id;
        this.season_number = season_number;
        this.episode_number = episode_number;
        this.title = title;
        this.trailer_url = trailer_url;
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public int getIdMinusOne() { return id - 1; }

    public int getMedia_id() {
        return media_id;
    }

    public int getSeason_number() {
        return season_number;
    }

    public int getEpisode_number() {
        return episode_number;
    }

    public String getTitle() {
        return title;
    }

    public String getTrailer_url() {
        return trailer_url;
    }

    public int getDuration() {
        return duration;
    }
}