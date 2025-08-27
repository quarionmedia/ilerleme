<?php
// File: app/Models/WatchlistModel.php

namespace App\Models;
use Database;

class WatchlistModel {
    private $db;

    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }

    /**
     * Toggles an item in the user's watchlist (adds if not present, removes if present).
     * @param int $userId
     * @param string $contentType 'movie' or 'tv_show'
     * @param int $contentId
     * @return string 'added' or 'removed'
     */
    public function toggleStatus($userId, $contentType, $contentId) {
        // First, check if the item is already in the watchlist
        $stmt = $this->db->prepare("SELECT id FROM user_watchlist WHERE user_id = ? AND content_type = ? AND content_id = ?");
        $stmt->execute([$userId, $contentType, $contentId]);
        $existing = $stmt->fetch();

        if ($existing) {
            // Item exists, so remove it
            $stmt = $this->db->prepare("DELETE FROM user_watchlist WHERE id = ?");
            $stmt->execute([$existing['id']]);
            return 'removed';
        } else {
            // Item does not exist, so add it
            $stmt = $this->db->prepare("INSERT INTO user_watchlist (user_id, content_type, content_id) VALUES (?, ?, ?)");
            $stmt->execute([$userId, $contentType, $contentId]);
            return 'added';
        }
    }

    /**
     * Checks if a specific item is in the user's watchlist.
     * @param int $userId
     * @param string $contentType
     * @param int $contentId
     * @return bool
     */
    public function isInWatchlist($userId, $contentType, $contentId) {
        $stmt = $this->db->prepare("SELECT id FROM user_watchlist WHERE user_id = ? AND content_type = ? AND content_id = ?");
        $stmt->execute([$userId, $contentType, $contentId]);
        return $stmt->fetch() !== false;
    }
}