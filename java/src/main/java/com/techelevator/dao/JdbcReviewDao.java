package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Review> listByBeerId(int beerId) {
        List<Review> reviews = new ArrayList<Review>();
        String sql = "SELECT review_id, beer_id, reviewer, review, rating FROM reviews WHERE beer_id = ?";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, beerId);
        while(rows.next()) {
            reviews.add( mapRowToReview(rows) );
        }
        return reviews;
    }

    @Override
    public Review getById(int reviewId) {
        Review review = null;
        String sql = "SELECT review_id, beer_id, reviewer, review, rating FROM reviews WHERE review_id = ?";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, reviewId);
        if (rows.next()) {
            review = mapRowToReview(rows);
        }
        return review;
    }

    @Override
    public Review add(Review review, int beerId) {
        String sql = "INSERT INTO reviews (beer_id, reviewer, review, rating) " +
                "VALUES (?, ?, ?, ?) RETURNING review_id";
        int reviewId = jdbcTemplate.queryForObject(sql, int.class, beerId, review.getReviewer(),
                review.getReview(), review.getRating());
        review.setReviewId(reviewId);
        review.setBeerId(beerId);
        return review;
    }
//
//    @Override
//    public Review update(Review review) {
//        return null;
//    }

//    @Override
//    public void delete(int beerId) {
//
//    }

    private Review mapRowToReview(SqlRowSet rowSet) {
        Review review = new Review();

        review.setReviewId(rowSet.getInt("review_id"));
        review.setBeerId(rowSet.getInt("beer_id"));
        review.setReviewer(rowSet.getString("reviewer"));
        review.setReview(rowSet.getString("review"));
        review.setRating(rowSet.getInt("rating"));

        return review;
    }
}
