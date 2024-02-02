using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MoreMountains.Feedbacks;
public class Enemy : MonoBehaviour
{
    [SerializeField]
    private int hp;
    private bool isDead = false;
    GameManager gameManager;

    public MMF_Player getDamageFeedback;
    // Start is called before the first frame update
    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void GetDamage(int d) {
        hp -= d;
        if (!getDamageFeedback.IsPlaying)
        {
            getDamageFeedback.PlayFeedbacks();
        }
        //damage feedback
        if (hp < 0) {
            hp = 0;
            isDead = true;
            Die();
        }
    }
    void Die() {
        gameManager.isEnemyExist = false;
        gameManager.SpawnEnemy();
        Destroy(this.gameObject);
    }
    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.tag == "Bullet") {
            Destroy(col.gameObject);
            GetDamage(1);
        }
    }
}
