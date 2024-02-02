using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hero : MonoBehaviour
{
    public float atkCoolTime;
    public float atkTimer;

    public GameObject bulletPrefab;

    public Transform enemyPosition;

    GameManager gameManager;
    // Start is called before the first frame update
    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
    }

    // Update is called once per frame
    void Update()
    {
        atkTimer += Time.deltaTime;
        
        if (atkTimer >= atkCoolTime && gameManager.isEnemyExist)
        {
            atkTimer = 0;
            Attack();
        }
    }

    void Attack()
    {
        // Instantiate the bullet and set its direction towards the enemy
        GameObject newBullet = Instantiate(bulletPrefab, transform.position, Quaternion.identity);
        newBullet.GetComponent<Bullet>().SetDirection(GetEnemyDirection());
    }

    Vector2 GetEnemyDirection()
    {
        // Assuming you have a reference to the enemy or its position
        // You may need to replace this logic based on your actual game structure
        if (enemyPosition != null)
        {
            return (Vector2)enemyPosition.position - (Vector2)transform.position;
        }
        else
        {
            // If there's no enemy position, return a default direction (you may want to handle this case appropriately)
            return Vector2.right;
        }
    }
}
