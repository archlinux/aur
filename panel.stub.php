<?php

// The parts of the panel that sourcebans-pp.php uses, for Mago: the script loads them from the
// installed panel at runtime (includes/Db/Database.php, updater/Updater.php)

declare(strict_types=1);

final class Database
{
    public function __construct(
        string $host,
        int $port,
        string $dbname,
        string $user,
        string $password,
        string $prefix,
        string $charset = 'utf8',
    ) {}

    public function query(string $query): self
    {
        return $this;
    }

    public function bind(int|string $param, int|bool|string|null $value, ?int $type = null): void {}

    /**
     * @param array<array-key, mixed>|null $inputParams
     */
    public function execute(?array $inputParams = null): bool
    {
        return true;
    }

    /**
     * @param array<array-key, mixed>|null $inputParams
     */
    public function single(?array $inputParams = null, int $fetchType = PDO::FETCH_ASSOC): mixed
    {
        return null;
    }
}

class Updater
{
    public function __construct(Database $dbs) {}

    /**
     * @return list<string>
     */
    public function getMessageStack(): array
    {
        return [];
    }
}
