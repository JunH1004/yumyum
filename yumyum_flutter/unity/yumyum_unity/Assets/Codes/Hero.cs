using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MoreMountains.Feedbacks;
public class Hero : MonoBehaviour
{
    public float atkCoolTime;
    public float atkTimer;

    public GameObject bulletPrefab;

    public Transform enemyPosition;

    public MMF_Player attackFeedback;
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
        
        if (atkTimer >= atkCoolTime && gameManager.isEnemyExist && !gameManager.isBroTime)
        {
            atkTimer = 0;
            Attack();
        }
    }

    void Attack()
    {
        attackFeedback.PlayFeedbacks();
        // Instantiate the bullet and set its direction towards the enemy
        GameObject newBullet = Instantiate(bulletPrefab, transform.position, Quaternion.identity);
        newBullet.GetComponent<Bullet>().SetTargetPosition(enemyPosition.position);
    }
}
