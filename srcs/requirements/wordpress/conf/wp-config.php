<?php
define( 'DB_NAME', getenv('DB_NAME') );
define( 'DB_USER',  getenv('DB_USER') );
define( 'DB_PASSWORD', getenv('DB_PASSWORD') );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '');

define( 'WP_REDIS_HOST', 'redis');
define( 'WP_REDIS_PORT', '6379');
define( 'WP_REDIS_PASSWORD', 'redis');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
