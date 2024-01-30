<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link https://fr.wordpress.org/support/article/editing-wp-config-php/ Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'db_wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'fcoindre' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'mypass' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'mariadb' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'JymzA#K2)wQ}nDN[C9-)nK@w;:g0lGS}fo04X>*1iW;|)F1uwp(S,1X>BdhK+41 ' );
define( 'SECURE_AUTH_KEY',  'KJ;D4:U.6Dp:<7m}8NSxvljMXn<_yq[8~^wlGz.{g!AK3Hn,@`qxv6`=T;D($DOI' );
define( 'LOGGED_IN_KEY',    '3wynUGX0U&bsZ6~tJpTJbzUMlf;55j`ja@8p!=a>?oT4/dt{3/SH_; g5WrxOrO$' );
define( 'NONCE_KEY',        '(*~Gl+Ng*NkQ&C^vZ14wfG`RHYRxDQjx}f*$ 35^q,I{^zb~w^~iW_46<U}s~_u?' );
define( 'AUTH_SALT',        '9Wq`2Y o{hjb&ZZfGo,f]z8Lb5X?;~~W[|rt-X8{gX#l2di.[0B0GYLiv]TnOD8y' );
define( 'SECURE_AUTH_SALT', 'J#UJF{{N$HL0tOMQhbRXd1dUuOsQ7]w*y^Q!iRzZQs8q~J_=w}F0fX,,Z8K=uR*@' );
define( 'LOGGED_IN_SALT',   '!/l)^_ DW|c:$}~5*[SG@sf~gxr)ww4(~|Aw~?>)%-G=uWbb`o>3.t]^.&PtRWS_' );
define( 'NONCE_SALT',       '!ofoHgkqK:2b<D ]n${{TA)j?X8H<1AS=Lw3Qz*XJ$i|ddjD#zeSk0{c46hT[R3}' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs et développeuses : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs et développeuses d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur la documentation.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');