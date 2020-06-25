package com.codflix.backend.features.episode;

import com.codflix.backend.core.Database;
import com.codflix.backend.models.Episode;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class EpisodeDao {

    public List<Episode> getEpisodeByMediaId(int id) {
        List<Episode> episodes = new ArrayList<>();

        Connection connection = Database.get().getConnection();
        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM episode WHERE media_id=?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                episodes.add(mapToEpisode(rs));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return episodes;
    }

    public List<Integer> getSeasons(int id){
        List<Integer> seasons = new ArrayList<>();

        Connection connection = Database.get().getConnection();
        try {
            PreparedStatement st = connection.prepareStatement("SELECT season_number FROM episode WHERE media_id=? GROUP BY season_number");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                seasons.add(rs.getInt(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seasons;
    }

    public List<Episode> getEpisodeBySeason(int id){
        List<Episode> episodes = new ArrayList<>();

        Connection connection = Database.get().getConnection();
        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM episode WHERE season_number=?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                episodes.add(mapToEpisode(rs));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return episodes;
    }



    private Episode mapToEpisode(ResultSet rs) throws SQLException, ParseException {
        return new Episode(
                rs.getInt(1), // id
                rs.getInt(2), // media_id
                rs.getInt(3), // season_number
                rs.getInt(4), // episode_number
                rs.getString(5), // title
                rs.getString(6), // trailer_url
                rs.getInt(7) // duration
        );
    }
}
