using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MoreMountains.Feedbacks;
public class BroBoss : MonoBehaviour
{
    public Vector3 initPos;
    public SpriteRenderer spriteRenderer;
    public Sprite afterSprite;
    public GameManager gameManager;
    public GameObject broHead;

    public MMF_Player backFeedback;
    // Start is called before the first frame update
    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        transform.position = initPos;
        spriteRenderer = GetComponent<SpriteRenderer>();
        StartCoroutine(AtkSequence());
    }
    IEnumerator AtkSequence()
    {
        
        yield return new WaitForSeconds(2);
        //공격
        spriteRenderer.sprite = afterSprite;
        transform.Translate(0, -0.45f, 0);
        Instantiate(broHead, transform.position + new Vector3(0,0.67f,0), Quaternion.identity);

        yield return new WaitForSeconds(1f);
        backFeedback.PlayFeedbacks();
        yield return new WaitForSeconds(2f);
        gameManager.isBroTime = false;
        Destroy(this.gameObject);
    }

}
